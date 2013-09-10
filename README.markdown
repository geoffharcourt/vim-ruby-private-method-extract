# vim-ruby-private-method-extract

Experimental project to extract private methods out of longer existing methods.

* Creates a private section of the class if one doesn't exist.
* Takes a visual selection and names the method after the local variable before the equals sign.
* Makes the statement following the equals sign the method body.
* Trims whitespace and fixes indentation after call.

This project is an initial effort in learning Vimscript. Contributions and suggestions for improvement are very welcome.

# How to use
1. In visual mode (I use visual-line mode), select a piece of a method that you want to extract to a private method.
2. Call ExtractPrivateMethod(). You can bind this to a shortcut for maximum efficiency.
3. If your class has a private section, a new private method is inserted with the statement selected. The method is named after the local variable before the equals sign, and the method body is the statement after the equals sign.
4. The original statement is deleted.

Example:

Start with this:

```ruby
class MyClass
  
  def too_long_method
    temp_query = thing_to_call.method_to_call

    temp_query.something_else_to_do
  end

end
```

After highlighting the first line of ````too_long_method```` and calling ````ExtractPrivateMethod()````, the class looks like this:

```ruby
class MyClass
  
  def too_long_method
    temp_query.something_else_to_do
  end

  private

  def temp_query
    thing_to_call.method_to_call
  end

end
```

# Credits
vim-ruby-private-method-extract was created and is maintained by [Geoff Harcourt](http://github.com/geoffharcourt).

The functionality was inspired by a macro run by [Ben Orenstein](http://github/com/r00k) during his "Refactoring From Good to Great" talks.

## License
vim-ruby-private-method-extract is free software, and may be redistributed under the terms specified in the [LICENSE](https://github.com/geoffharcourt/vim-ruby-private-method-extract/blob/master/LICENSE) file.
