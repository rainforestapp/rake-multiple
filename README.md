# Rake::Multiple

Rake::Multiple is the easiest way to run the same Rake task in multiple forked processes. It's particularly useful if your app is hosted on a PaaS provider, such as Heroku, and you want to run multiple worker processes by container, saving money.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rake-multiple'
```

And then execute:

    $ bundle

## Usage

Rake::Multiple can invoke any task by prefixing the `multiple` namespace to the task. So if you're running:

```bash
rake jobs:work
```

You can then run two processes in your app with the following command:

```bash
MULTIPLE_WORKER_COUNT=2 rake multiple:jobs:work
```

If your tasks need has dependencies, you can run a specific dependency by using the `MULTIPLE_EXECUTE_TASK` variable.

```bash
MULTIPLE_WORKER_COUNT=2 MULTIPLE_EXECUTE_TASK=environment rake multiple:jobs:work
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/rake-multiple/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
