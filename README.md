![Ruby](https://github.com/kwent/omniauth-pagerduty/workflows/Ruby/badge.svg?branch=master)

# OmniAuth PagerDuty

This is the official OmniAuth strategy for authenticating to PagerDuty. To
use it, you'll need to sign up for an OAuth2 Application ID and Secret
on the [PagerDuty Developer Page](https://developer.pagerduty.com/sign-up/).

## Installation

```ruby
gem 'omniauth-pagerduty'
```

## Basic Usage

```ruby
use OmniAuth::Builder do
  provider :pagerduty, ENV['PAGERDUTY_KEY'], ENV['PAGERDUTY_SECRET']
end
```

## Basic Usage Rails

In `config/initializers/pagerduty.rb`

```ruby
  Rails.application.config.middleware.use OmniAuth::Builder do
    provider :pagerduty, ENV['PAGERDUTY_KEY'], ENV['PAGERDUTY_SECRET']
  end
```

## Scopes

PagerDuty API v3 lets you set scopes to provide granular access to different types of data:

```ruby
use OmniAuth::Builder do
  provider :pagerduty, ENV['PAGERDUTY_KEY'], ENV['PAGERDUTY_SECRET']
end
```

## Semver

This project adheres to Semantic Versioning 2.0.0. Any violations of this scheme are considered to be bugs.
All changes will be tracked [here](https://github.com/kwent/omniauth-pagerduty/releases).

## License

Copyright (c) 2020 Quentin Rousseau.

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
