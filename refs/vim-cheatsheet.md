# Movement
--------
`<Ctrl-o>        return cursor to last position`

`<Ctrl-i>        move cursor forward`


`f<char>         move to next char`

`F<char>         move to previous char`

`t<char>         move until next char`

`T<char>         move until previous char`

`e               move to end of a word`

`_               move to first nonwhitespace character on line`

`+               move to first nonwhitespace character on next line`

`-               move to first nonwhitespace chacacter on previous line`

`0               move to the first character on line`

`$               move to the last character on line`

# Examples:
---------
`d3f.            delete up to and including the 3rd forward period`

`y5Te            yank up to but not including the 5th backward 'e'`


# Append / Insert
---------------
`A               append at the end of the line`

`a               append at the cursor`

`I               insert at the beginning of the line`

`i               insert at the cursor`


# Deleting / Changing
-------------------
`d+a+w           delete whole word`

`c+a+w           change whole word`

`C               change to end of line`

`D               delete to end of line`

`c+c             change whole line`

`d+d             delete whole line`


# Search / Replace
----------------
`:%s/foo/bar/g   find each occurence of foo and replace it with bar`
