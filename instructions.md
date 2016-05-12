## LiveReload

Add the following gems to the `:development` group in your `Gemfile`:

```ruby
gem 'guard-livereload'
gem 'rack-livereload'
```

Run this in your bash console:

```bash
bundle install
guard init livereload
```

Add this to `config/environments/development.rb`:

```ruby
Rails.application.configure do
  config.middleware.insert_after ActionDispatch::Static, Rack::LiveReload, host: 'YOUR CLOUD9 URL HERE', port: 8081
  # ...
end
```

If you're not on Cloud9, omit the `host:` and `port:` parameters. If you are on Cloud9, enter the URL you view your application at (without the https:// part).

If you're on Cloud9, replace this line in your Guardfile:

```ruby
guard 'livereload' do
```

with this line:

```ruby
guard 'livereload', port: 8081 do
```

Now run `guard` in your bash terminal. You should see a line that says: `INFO - LiveReload is waiting for a browser to connect.`.

Now run your rails server. If you're on Cloud9 visit the page, but change `https` in the address bar to `http`. Now your page should refresh automatically when your files change!

## Bootstrap and SASS

Add this to your `Gemfile`:

```ruby
gem 'bootstrap-sass'
```

Rename `app/assets/stylesheets/application.css` to `app/assets/stylesheets/application.scss`.

Remove these lines from the file:

```css
/* 
 ...
 
 *= require_tree .
 *= require_self
 
 ...
*/
```

Now add these lines:

```scss
@import "bootstrap-sprockets";
@import "bootstrap";
```

You should try to keep the styles for each view in a file named after that model or controller. For example, in our blog application, we will put all styles related to the post views in a file called `posts.scss`. We need to import this file into the application.scss file with a line like this:

```scss
@import "posts";
```