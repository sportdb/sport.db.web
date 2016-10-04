# Todos


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
