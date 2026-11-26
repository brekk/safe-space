# safe-space

do stuff with version control awareness

[![Madlib Project Badge](https://img.shields.io/badge/madlib-purple?logo=github&logoSize=auto)](//github.com/madlib-lang/madlib) <!-- $MADLIB.projectBadge -->
[![safespace v0.1.0](https://img.shields.io/badge/v0.1.0-purple?label=version)](//github.com/brekk/safe-space) <!-- $MADLIB.json.version -->

---
## Usage

`safe-space` has one function in the API: `check`. You can use it to validate whether `git` exists in a directory, as well as whether there are uncommitted or unstaged changes.

### check

`check` will take a working directory as an input and return an asynchronous record of (`{git :: Boolean, uncommitted :: Boolean, unstaged :: Boolean }`).

You can import from `safe-space` and use the `check` function like this:

```madlib

import IO from "IO"
import List from "List"
import Maybe from "Maybe"
import Wish from "Wish"

import SafeSpace from "safe-space"


printOutput = Wish.fulfill(
  (e) => {
    IO.pTrace("bad path", e)
  },
  (x) => {
    IO.pTrace("good path", x)
  }
)

main = (args) => {
  cwd = pipe(
    List.drop(1),
    List.first,
    Maybe.fromMaybe("./"),
  )(args)
  pipe(
    SafeSpace.check,
    printOutput,
  )(cwd)
}
```
