## join method incorrectly handles paths with colons

NOTE: Only seems to reproduce on Python 3.6 and 3.7.

Example:

```
>>> from furl import furl
>>> furl("wss://example.com/").join("foo:1")
furl('http://example.com/foo:1')
```

Notice that it replaced the scheme `wss` with `http`.

Paths without colons work correctly:

```
>>> furl("wss://example.com/").join("foo")
furl('wss://example.com/foo')
```

The same test with `urllib.parse.urljoin` yields the correct result:

```
>>> from urllib.parse import urljoin
>>> urljoin("wss://example.com/", "foo:1")
'wss://example.com/foo:1'
>>> 
```

