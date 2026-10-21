from http.server import ThreadingHTTPServer

from ase_studio.backend import Handler, require_startup_repositories

require_startup_repositories()

server = ThreadingHTTPServer(("0.0.0.0", 80), Handler)

print("ASE Studio Web listening on http://0.0.0.0:80")
server.serve_forever()
