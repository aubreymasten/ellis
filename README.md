# trace_italian

#### _A tool for creating and playing text-based adventure games. Built with Rails._

#### _By: Aubrey Masten_

## Description

This project was initially created at [Epicodus](https://www.epicodus.com/) as a capstone project for the final term of class. The program allows users to create stories using a simple text-based editor built in Rails, and publish those stories, allowing other users to play through those stories. All data is saved to a PostgreSQL database. The system for playing stories (as well as much of the editor) was built to be asynchronous, allowing data to be saved and retrieved without leaving the current page. Starting a story is simple, so long as someone has made a story public. From the homepage click a story's card, click 'start story'. Once a story has loaded, a chunk of text will be displayed on the screen, followed by choices (highlighted in red). To make a choice, click one of the red links. When the story has ended, you will see a message and be offered to option to start over.

## Setup/Installation Requirements
**All setup instructions were tested using macOS version 10.12.3.**
To run this program on your own computer you will need to install [Rails](http://rubyonrails.org/) and [PostgreSQL](https://www.postgresql.org/). Once you have installed those programs follow the instructions below.

* Start a PostgreSQL server in the shell: `postgresql`
* In a separate shell window, clone this repository in a shell using the command:
`git clone https://github.com/aubreymasten/trace_italian`
* In the `trace_italian` directory run the following commands:
  * `bundle install`
  * `rails serve`

 The site should now be available in your browser at `localhost:3000` (if you are running any other local servers, the port number `:3000` may not be accurate. Check your shell after running `rails serve` for more information).

## Known Bugs

All development and setup instructions were tested on macOS using version 10.12.3 and Google Chrome version 58.0.3029.110 (64-bit).

## Support and contact details

_If you have any questions or find any issues with the site, get in touch. My email address is: aubreymasten@gmail.com_

## Technologies Used

* _[Ruby](https://www.ruby-lang.org/en/)_
* _[Rails](http://rubyonrails.org/)_
* _[Capybara](https://teamcapybara.github.io/capybara/)_
* _[PostgreSQL](https://www.postgresql.org/)_

## License

MIT License

Copyright (c) 2017 Aubrey Masten

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
