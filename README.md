# Useragent Supports

HTML5 and CSS3 have added lots of shiny features to the web developers toolset,
but you need a quick way to only serve new features to borwsers that support them.

Use this in your rails app to detect the capabilities of the current browser
and serve appropriate markup.

# Credit

The data behind this gem is supplied by Alexis Deveria from http://caniuse.com under
a CC BY-NC 3.0 license ( http://creativecommons.org/licenses/by-nc/3.0/ ).

Thanks Alexis.

## Installation

    gem install useragent_supports

## Usage

    if UseragentSupports.new.feature(:fileapi, request.user_agent)
      render :template => "html5_uploader.html.erb"
    else
      render :template => "flash_uploader.html.erb"
    end

## Authors

James Healy
  james@yob.id.au

## Further Reading
 * http://caniuse.com

## TODO

* Make the API suck less
* Make the versioning date based to allow for updates to the data with no code changes
  * 0.20120508
* rails integration?
* document the available features
