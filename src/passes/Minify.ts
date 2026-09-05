export function minifyPrinted(code: string): string {
    return code
        .replace(/\r\n|\r|\n/g, " ")
        .replace(/[ \t]+/g, " ")
        .trim()
}