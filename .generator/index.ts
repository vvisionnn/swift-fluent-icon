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
  const regularJsonPath = `${fluentIconProjectPath}/fonts/FluentSystemIcons-Regular.json`;
  const filledJsonPath = `${fluentIconProjectPath}/fonts/FluentSystemIcons-Filled.json`;
  const lightJsonPath = `${fluentIconProjectPath}/fonts/FluentSystemIcons-Light.json`;
  if (
    !fs.existsSync(resizableJsonPath) ||
    !fs.existsSync(regularJsonPath) ||
    !fs.existsSync(filledJsonPath) ||
    !fs.existsSync(lightJsonPath)
  ) {
    consola.error(`Fluent Icon project does not contain the required files`);
    throw new Error("Fluent Icon project does not contain the required file");
  }

  // name => unicode decimal
  const resizableJson = fs.readFileSync(resizableJsonPath, "utf8");
  const regularJson = fs.readFileSync(regularJsonPath, "utf8");
  const filledJson = fs.readFileSync(filledJsonPath, "utf8");
  const lightJson = fs.readFileSync(lightJsonPath, "utf8");

  const enumName = "FluentIcon";
  const resizableEnumValues = Object.entries(JSON.parse(resizableJson)).map(
    ([name, unicode]) => {
      // remove `ic_fluent_` prefix for name
      name = name.replace("ic_fluent_", "");
      // convert from snake_case to camelCase
      name = name
        .replace("20_", "")
        .replace(/_([a-z|0-9])/g, (g) => g[1].toUpperCase());
      // convert unicode decimal to hex
      unicode = `${(unicode as number).toString(16)}`;
      return [name, unicode];
    }
  );
  const regularEnumValues = Object.entries(JSON.parse(regularJson)).map(
    ([name, unicode]) => {
      name = name
        .replace("ic_fluent_", "")
        .replace(/_([a-z|0-9])/g, (g) => g[1].toUpperCase());
      unicode = `${(unicode as number).toString(16)}`;
      return [name, unicode];
    }
  );

  const filledEnumValues = Object.entries(JSON.parse(filledJson)).map(
    ([name, unicode]) => {
      name = name
        .replace("ic_fluent_", "")
        .replace(/_([a-z|0-9])/g, (g) => g[1].toUpperCase());
      unicode = `${(unicode as number).toString(16)}`;
      return [name, unicode];
    }
  );

  const lightEnumValues = Object.entries(JSON.parse(lightJson)).map(
    ([name, unicode]) => {
      name = name
        .replace("ic_fluent_", "")
        .replace(/_([a-z|0-9])/g, (g) => g[1].toUpperCase());
      unicode = `${(unicode as number).toString(16)}`;
      return [name, unicode];
    }
  );

  const enumContent = `public enum ${enumName} {
  public enum Resizable: String, CaseIterable, Sendable {
    ${resizableEnumValues
      .map(([name, unicode]) => {
        return `case ${name} = "\\u\{${unicode}\}"`;
      })
      .join("\n    ")}
  }

  public enum Regular: String, CaseIterable, Sendable {
    ${regularEnumValues
      .map(([name, unicode]) => {
        return `case ${name} = "\\u\{${unicode}\}"`;
      })
      .join("\n    ")}
  }

  public enum Filled: String, CaseIterable, Sendable {
    ${filledEnumValues
      .map(([name, unicode]) => {
        return `case ${name} = "\\u\{${unicode}\}"`;
      })
      .join("\n    ")}
  }

  public enum Light: String, CaseIterable, Sendable {
    ${lightEnumValues
      .map(([name, unicode]) => {
        return `case ${name} = "\\u\{${unicode}\}"`;
      })
      .join("\n    ")}
  }
}`;

  fs.writeFileSync(`${enumDestPath}/${enumName}.swift`, enumContent);
};

const copyRequiredResources = async (
  fluentIconProjectPath: string,
  destPath: string
) => {
  fs.mkdirSync(destPath, { recursive: true });
  const resizableFontPath = `${fluentIconProjectPath}/fonts/FluentSystemIcons-Resizable.ttf`;
  const regularFontPath = `${fluentIconProjectPath}/fonts/FluentSystemIcons-Regular.ttf`;
  const filledFontPath = `${fluentIconProjectPath}/fonts/FluentSystemIcons-Filled.ttf`;
  const lightFontPath = `${fluentIconProjectPath}/fonts/FluentSystemIcons-Light.ttf`;
  if (!fs.existsSync(resizableFontPath)) {
    consola.error(
      `Fluent Icon project does not contain the required file: ${resizableFontPath}`
    );
    throw new Error("Fluent Icon project does not contain the required file");
  }

  fs.copyFileSync(
    resizableFontPath,
    `${destPath}/FluentSystemIcons-Resizable.ttf`
  );
  fs.copyFileSync(regularFontPath, `${destPath}/FluentSystemIcons-Regular.ttf`);
  fs.copyFileSync(filledFontPath, `${destPath}/FluentSystemIcons-Filled.ttf`);
  fs.copyFileSync(lightFontPath, `${destPath}/FluentSystemIcons-Light.ttf`);
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
