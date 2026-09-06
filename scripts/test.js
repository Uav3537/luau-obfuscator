import fs from 'fs'
import { obfuscate } from '../dist/index.js'
import path from 'path'

const smokedir = path.join(process.cwd(), "smoketest")

const GENERATE_DIR = path.join(process.cwd(), "generated")

fs.rmSync(GENERATE_DIR, { recursive: true, force: true });
fs.mkdirSync(GENERATE_DIR, { recursive: true });


for(const filename of fs.readdirSync(smokedir)) {
    const content = fs.readFileSync(path.join(smokedir, filename), 'utf-8')
    const timeStart = performance.now()
    const obfuscated = obfuscate(content, {
        Minify: {active: false},
        NumbersToExpressions: {active: false},
        StringsToExpressions: {active: false}
    })
    const timeEnd = performance.now()
    fs.writeFileSync(path.join(GENERATE_DIR, `${filename}`), obfuscated)
    console.log(`obfuscating ${filename} took ${(timeEnd - timeStart) / 1000}s, length: ${content.length} -> ${obfuscated.length}`)
}