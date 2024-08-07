import { program } from "commander";
import fs from "fs";
import consola from "consola";

const generateSwiftEnum = async (
  fluentIconProjectPath: string,
  enumDestPath: string
) => {
  if (!fs.existsSync(fluentIconProjectPath)) {
    consola.error(
      `Fluent Icon project not found at path: ${fluentIconProjectPath}`
    );
    throw new Error("Fluent Icon project not found");
  }

  const resizableJsonPath = `${fluentIconProjectPath}/fonts/FluentSystemIcons-Resizable.json`;
  if (!fs.existsSync(resizableJsonPath)) {
    consola.error(
      `Fluent Icon project does not contain the required file: ${resizableJsonPath}`
    );
    throw new Error("Fluent Icon project does not contain the required file");
  }

  // name => unicode decimal
  const resizableJson = fs.readFileSync(resizableJsonPath, "utf8");

  const enumName = "FluentIcon";
  const enumValues = Object.entries(JSON.parse(resizableJson)).map(
    ([name, unicode]) => {
      // remove `ic_fluent_` prefix for name
      name = name.replace("ic_fluent_", "");
      // convert from snake_case to camelCase
      name = name.replace(/_([a-z|0-9])/g, (g) => g[1].toUpperCase());
      // convert unicode decimal to hex
      unicode = `${(unicode as number).toString(16)}`;
      return `case ${name} = "\\u\{${unicode}\}"`;
    }
  );

  const enumContent = `
public enum ${enumName}: String, CaseIterable, Sendable {
  ${enumValues.join("\n  ")}
}`;

  fs.writeFileSync(`${enumDestPath}/${enumName}.swift`, enumContent);
};

const copyRequiredResources = async (
  fluentIconProjectPath: string,
  destPath: string
) => {
  fs.mkdirSync(destPath, { recursive: true });
  const fontPath = `${fluentIconProjectPath}/fonts/FluentSystemIcons-Resizable.ttf`;
  if (!fs.existsSync(fontPath)) {
    consola.error(
      `Fluent Icon project does not contain the required file: ${fontPath}`
    );
    throw new Error("Fluent Icon project does not contain the required file");
  }

  fs.copyFileSync(fontPath, `${destPath}/FluentSystemIcons-Resizable.ttf`);
};

program
  .version("0.0.1")
  .description("Fluent Icon Swift Enum Generator")
  .option("-i, --input <path>", "Path to Fluent Icon project")
  .option("-o, --output <path>", "Path to output Swift enum")
  .action((options) => {
    consola.info(`Creating Swift enum from Fluent Icon project...`);
    consola.info(`Input: ${options.input}`);
    consola.info(`Output: ${options.output}`);
    const packageSourcePath = `${options.output}/Sources`;
    const fluentIconProductPath = `${packageSourcePath}/FluentIcon`;
    const fontResourceFolderPath = `${fluentIconProductPath}/Resources`;
    fs.mkdirSync(packageSourcePath, { recursive: true });
    fs.mkdirSync(fluentIconProductPath, { recursive: true });
    fs.mkdirSync(fontResourceFolderPath, { recursive: true });

    generateSwiftEnum(options.input, fluentIconProductPath)
      .then(() => {
        consola.success(
          `Swift enum generated at: ${fluentIconProductPath}/FluentIcon.swift`
        );
        consola.info(`Copying required resources...`);
        return copyRequiredResources(options.input, fontResourceFolderPath);
      })
      .then(() => {
        consola.success(
          `Required resources copied to: ${fontResourceFolderPath}`
        );
      })
      .catch((error) => {
        consola.error(error);
      });
  })
  .parse(process.argv);
