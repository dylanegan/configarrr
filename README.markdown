## configarrr

### Description:

A simple interface for providin' configuration. Not all o' me own creations. Parts borrowed, see Acknowledgements.

### Usage:

    config = Configarrr::Simple.configure do
      set :key, :value
      set :hash => { :other_key => :other_value }
    end

    >> config.key
    => :value
    >> config.hash[:other_key]
    => :other_value

### Acknowledgements:

Sinatra - http://github.com/sinatra/sinatra/blob/master/lib/sinatra/base.rb - borrowed set and metadef.

### License:

(The MIT License)

Copyright (c) 2009 Dylan Egan

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the 'Software'), to deal in
the Software without restriction, including without limitation the rights to use,
copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the
Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED,
INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR
PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
