#!/bin/bash
### make sure this file is chmod +x
curl -sSL https://github.com/NodeBB/NodeBB/archive/v1.12.x.tar.gz | tar xz --strip 1
cp install/package.json package.json
npm install --production
npm cache clean --force
rm -r .[!.]*
rm -rf /tmp/npm*
