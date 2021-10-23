## Functions
https://ethereum.org/en/developers/docs/smart-contracts/anatomy/#functions
- `fallback` function is called if there is absence of data or a declared function name.
- Any functions mark with `internal`, `pure` or `view` are gas-free.
- Compilers will automatically create getter for public state variables
 
### Function and variables specifier:
- `internal`: accessed internally by the contract or derived contract 
- `external`: can be called by other contracts or transactions. And cannot be called internally.
- `public`  : can be called internally by current contract or externally by messages
- `private` : visible to current contract and not derived contracts

### Requirements of a function
- parameter variable and type (if it accepts parameters)
- declaration of internal/external
- declaration of pure/view/payable
- returns type (if it returns a value)

