import fs from 'fs'
import { obfuscate } from '../dist/index.js'

const exampleScript = fs.readFileSync('./scripts/example.luau', 'utf-8')
const obfuscated = obfuscate(exampleScript, {
    Minify: {active: false},
    
})
fs.writeFileSync('./generated/final.luau', obfuscated)

const smoketest = fs.readFileSync('./scripts/smoketest.luau', 'utf-8')
const smoketestobfuscated = obfuscate(smoketest, {
    Minify: {active: false},
    
})
fs.writeFileSync('./generated/smoketest.luau', smoketestobfuscated)