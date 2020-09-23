## Require Array Source problem

Problem: Requiring a large ruby source file requires a LOT of memory. In this case the `huge_array_native.rb` file contains a large array. When you require it requires about 28mb of RSS memory:

```
Memory difference (reading in a ruby array from source): 28.2890625 mb
```

To prove that this can be done with substantially less memory. I've written another way to generate the array that instead stores the array externally in a text file and then loops through and builds it up in memory. See `array_from_file.rb`. When you require it, it requires about 2-3mb of memory:

```
Memory difference (building an array from text file):     2.95703125 mb
```

Which is considerably less than requiring the Ruby source code.

## Reproduction

```
$ bundle exec ruby main.rb
Memory difference (building an array from text file):     2.95703125 mb
Memory difference (reading in a ruby array from source): 28.2890625 mb
```

## Theory

I believe this behavior of Ruby is the underlying cause of many libraries' large memory usage:

- https://github.com/mime-types/ruby-mime-types/issues/94 (closed and resolved)
- https://github.com/mikel/mail/issues/1342 (closed, but not resolved)
- https://github.com/aws/aws-sdk-ruby/issues/2409

I don't know what is causing the excess RSS usage, but it seems to come from Ruby's parsing-lexing-interpreting process, rather than a strict requirement of the final resultant code.
