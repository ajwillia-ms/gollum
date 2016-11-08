=begin
This file can be used to (e.g.):
- alter certain inner parts of Gollum,
- extend it with your stuff.

It is especially useful for customizing supported formats/markups. For more information and examples:
- https://github.com/gollum/gollum#config-file

=end

# enter your Ruby code here ...

Gollum::Page.send :remove_const, :FORMAT_NAMES if defined? Gollum::Page::FORMAT_NAMES

# first remove all markups:
Gollum::Markup.formats.clear

# and then define the sole markup to be supported:
Gollum::Markup.formats[:markdown] = {
    :name => "Markdown",
    :regexp => /md|mkdn?|mdown|markdown/
}

