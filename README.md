# Capybara Wait Discrepancy Demo

This project aims to demonstrate a subtle discrepancy
between the different page body matchers in rspec/capybara.

The discrepancy isn't necessarily a bad thing,
as it gives developers more power to control the behavior of their tests.
However, it's important to be aware of.
Using the wrong matcher will cause slow tests,
and can cause tests to fail intermittently.
These intermittent failures are particularly pronounced in CI,
where resources are frequently more constrained than on developer machines.

The difference lies between using Rspec and using Capybara to
negate expectation.
For example, either one of these appears to be a valid way to expect
some content not be there:
```ruby
expect(page).not_to have_content('some words')
expect(page).to have_no_content('some words')
```
There are two important, related differences.
They have to do with Capybara's
[intelligent waiting behavior](https://github.com/teamcapybara/capybara#asynchronous-javascript-ajax-and-friends)
1. The first expectation will fail immediately if the content is there.
  The second expectation will wait if the content is there initially,
  and pass if the content appears within the Capybara wait time.
1. The first expectation will wait for the content to appear
  if it is not there initially,
  and fail of the content appears within the Capybara wait time.
  The second expectation will pass immediately if the content is not there
  initially.

The project under test was generated with
[Angular CLI](https://github.com/angular/angular-cli) 
version 1.7.4, with a few minor revisions to cause the events I tested for.

## Running the tests

You'll need NPM, the Angular CLI, Ruby, and Bundler installed.
Included are instructions for how to make this happen on a Mac.

1. `brew install npm rbenv`
1. `npm install --global @angular/cli`
1. `rbenv install 2.5.0`
1. `rbenv local 2.5.0`
1. `gem install bundler`

From this point,
you are ready to install the application dependencies.

1. `npm install`
1. `bundle install`

Now you can run the tests: `bundle exec rspec`

You should see four failures, the origins of which are the point of this repo.
