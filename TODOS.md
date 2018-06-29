# Todos

- [ ] use puma start code directly (do NOT use rack handler for now)

- [ ] check if we can move rails app root to sportweb/lib/sportweb ?
      is sportweb now and public is sportweb/public - do we care anyway?



- [ ] check if app is running development or production???
    - use development or production - why? why not??

```
Rails.version:     4.2.7.1
Rails.env:         development
Rails.root:        C:/Sites/sportdb/sport.db.web
Rails.application.class: SportWebHost
Rails.application.assets.class: Sprockets::CachedEnvironment
```


## Errors

```
ActionView::Template::Error (Asset was not declared to be precompiled in production.
Add `Rails.application.config.assets.precompile += %w( flags/24x24/de.png )` to `config/initializers/assets.rb` and restart your server):
```

```
ActionView::Template::Error (Asset was not declared to be precompiled in production.
Add `Rails.application.config.assets.precompile += %w( flags/24x24/at.png )` to `config/initializers/assets.rb` and restart your server):
    1:
    2: <span>
    3:   <%= flag_for_country( team.country ) %>
```

```
ActionController::RoutingError (No route matches [GET] "/images/flags/24x24/eng.png"):
```

```
fix route for /favicon
add favicon or return 404 etc.

ActiveRecord::RecordNotFound: Couldn't find SportDb::Model::Team
```

```
ActionView::Template::Error: Asset was not declared to be precompiled in production.

Add `Rails.application.config.assets.precompile += %w( flags/24x24/de.png )` to `config/initializers/assets.rb` and restart your server
```


```
DEPRECATION WARNING: You didn't set `secret_key_base`. Read the upgrade documentation to learn more about this new config option. (called from main at ./lib/sportweb.rb:54)
```
