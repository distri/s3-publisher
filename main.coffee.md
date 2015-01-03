S3 Publisher
============

TODO: This should just publish a single JSON package file for use with `launcher`
That same package could be loaded in an editor, modified, and saved again.

TODO: Think about publishing docs html as a separate thing.

    Uploader = require "s3-uploader"

    module.exports = (policy) ->
      uploader = Uploader(policy)

      publish: (name, pkg) ->
        # TODO: Gzip
        blob = new Blob [JSON.stringify(pkg)],
          type: "application/json"

        uploader.upload
          key: "#{name}.json"
          blob: blob
