#!/bin/bash

echo "
? to research access pipe how ?
grep
       -x, --line-regexp
              Select only those matches that exactly match the whole line.  For a regular expression pattern,
              this is like parenthesizing the pattern and then surrounding it with ^ and $.
GREP_COLORS
              Specifies  the  colors and other attributes used to highlight various parts of the output.  Its
              value    is    a    colon-separated    list    of     capabilities     that     defaults     to
              ms=01;31:mc=01;31:sl=:cx=:fn=35:ln=32:bn=32:se=36  with  the  rv  and  ne  boolean capabilities
              omitted (i.e., false).  Supported capabilities are as follows.

GREP_COLORS='ms=01
35:mc=01
35:sl=:cx=:fn=35:ln=32:bn=32:se=36'
mt=01;34
mt=01;31
        SGR  substring  for  matching non-empty text in any matching line (i.e., a selected line
        when the -v command-line option is omitted, or a context line  when  -v  is  specified).
        Setting  this  is equivalent to setting both ms= and mc= at once to the same value.  The
        default is a bold red text foreground over the current line background.

ms=01;31
        SGR substring for matching non-empty text in a selected line.  (This is only  used  when
        the -v command-line option is omitted.)  The effect of the sl= (or cx= if rv) capability
        remains active when this kicks in.  The default is a bold red text foreground  over  the
        current line background.

mc=01;31
        SGR  substring  for  matching non-empty text in a context line.  (This is only used when
        the -v command-line option is specified.)   The  effect  of  the  cx=  (or  sl=  if  rv)
        capability remains active when this kicks in.  The default is a bold red text foreground
        over the current line background.
"
