samwise-- A git-based WYSIWYG Wiki
====================================

## DESCRIPTION

Samwise is an easy to use Wiki system built on top of Gollum and Git. A Samwise Wiki is simply a git repository (either bare or regular) that stores documents in markdown files:
* Samwise pages:
	* May be written in markdown.
	* Can be edited with your favourite system editor or IDE (changes will be visible after committing).
	* Can be edited in the What-You-See-Is-What-You-Get web interface.
	* Can be displayed in all versions (commits).

Samwise can be launched either as a webserver (with the web interface) or in "console mode", where you can use a predefined API to query and manipulate the repository. For more information, see the [Running](#running) and [Configuration](#configuration) sections.

## SYSTEM REQUIREMENTS

| Operating System | Ruby           | Adapters           | Supported |
| ---------------- | -------------- | ------------------ | --------- |
| Unix/Linux-like  | Ruby 1.9.3+    | all except [RJGit](https://github.com/repotag/rjgit) | yes |
| Unix/Linux-like  | [JRuby](https://github.com/jruby/jruby) (1.9.3+ compatible) | [RJGit](https://github.com/repotag/rjgit) | yes |
| Windows          | Ruby 1.9.3+    | all except [RJGit](https://github.com/repotag/rjgit) | no  |
| Windows          | [JRuby](https://github.com/jruby/jruby) (1.9.3+ compatible) | [RJGit](https://github.com/repotag/rjgit) | almost<sup>1</sup> |

**Notes:**

1. There are still some bugs and this setup is not ready for production yet. You can track the progress at [Support Windows via JRuby - Meta Issue](https://github.com/gollum/gollum/issues/1044).

## INSTALLATION

Varies depending on operating system, package manager and Ruby installation. Generally, you should first install Ruby and then Gollum.

1. Ruby is best installed either via [RVM](https://rvm.io/) or a package manager of choice.
2. Gollum is best installed via RubyGems:  
	```
	[sudo] gem install gollum
	```

Installation examples for individual systems can be seen [here](https://github.com/gollum/gollum/wiki/Installation).

**Notes:**  
* Whichever Ruby implementation you're using, Gollum ships with the appropriate default git adapter. So the above installation procedure is common for both MRI and JRuby.
* If you're installing from source:
	* Optionally uninstall any previous versions of Gollum:  
		```
		[sudo] gem uninstall -aIx gollum
		```
	* Install [Bundler](http://bundler.io/).
	* Navigate to the cloned source of Gollum.
	* Install dependencies:  
		```
		[sudo] bundle install
		```
	* Build:  
		```
		rake build
		```
	* And install:  
		```
		[sudo] gem install --no-ri --no-rdoc pkg/gollum*.gem
		```

### Markups

Samwise stores files only in [Markdown](http://daringfireball.net/projects/markdown/syntax) format.

Since all markups are rendered by the [github-markup](https://github.com/github/markup) gem, you can easily add support for other markups by additional installation:

By default, Gollum ships with the `kramdown` gem to render Markdown. However, you can use any [Markdown renderer supported by github-markup](https://github.com/github/markup/blob/master/lib/github/markup/markdown.rb). The thing to remember is that the first installed renderer from the list will be used. So, for example, `redcarpet` will NOT be used if `github/markdown` is installed.

## RUNNING

Simply:

1. Navigate to your git repository (wiki) via the command line.
2. Run: `bin/samwise`.
3. Open `http://localhost:4567` in your browser.

This will start up a web server (WEBrick) running Samwise with a web interface, where you can view and edit your wiki.

### Running from source

1. `git clone https://github.com/ajwillia-ms/samwise`
2. `cd samwise`
3. `[sudo] bundle install` (may not always be necessary).
4. `bundle exec bin/samwise`
	* Like that, samwise assumes the target wiki (git repository) is the project repository itself. If it's not, execute `bundle exec bin/samwise <path-to-wiki>` instead.
5. Open `http://localhost:4567` in your browser.

### Config file

When `--config` option is used, certain inner parts of Samwise can be customized. This is used throughout our wiki for certain user-level alterations.

**All of the mentioned alterations work both for Samwise' config file (`config.rb`) and Rack's config file (`config.ru`).**
