jsonpp() {
    python -c '
import sys, json

from pygments import highlight
from pygments.formatters import TerminalFormatter
from pygments.lexers import JsonLexer

def pprint(fp):

    data = json.dumps(
        json.load(fp),
        indent=4,
        sort_keys=True,
        ensure_ascii=False
    )

    highlight(data,
              JsonLexer(),
              TerminalFormatter(),
              sys.stdout)

if len(sys.argv) > 1:
    for i in sys.argv[1:]:
        pprint(open(i))
else:
    pprint(sys.stdin)
' $*
}

xmlpp() {
    python2 -c '
import sys

from pygments import highlight
from pygments.formatters import TerminalFormatter
from pygments.lexers import XmlLexer

from lxml.etree import fromstring, tostring

def pprint(fp):
    data = tostring(fromstring(fp.read()), pretty_print=True, encoding="unicode")
    highlight(data, XmlLexer(), TerminalFormatter(), sys.stdout)

if len(sys.argv) > 1:
    for i in sys.argv[1:]:
        pprint(open(i))
else:
    pprint(sys.stdin)
' $*
}

pyfind() {
    find $* -name "*.py"
}

dus() {
    find $* -maxdepth 1 -mindepth 1 -print0 | xargs -0 du -s | sort -n
}

pyclean() {
    find $* -name '*.pyc' -delete
    find $* -name '*~' -delete
    find $* -name '__pycache__' -print0 | xargs -0 rm -rf
    find $* -name '*.egg-info' -print0 | xargs -0 rm -rf
    find $* -name '.mypy_cache' -print0 | xargs -0 rm -rf
    find $* -name '.pytest_cache' -print0 | xargs -0 rm -rf
}

alias ipy='jupyter qtconsole --style monokai --ConsoleWidget.font_family="DejaVu Sans Mono" --ConsoleWidget.font_size=12'
