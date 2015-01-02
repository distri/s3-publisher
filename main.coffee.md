S3 Publisher
============

TODO: This should just publish a single JSON package file for use with `launcher`
That same package could be loaded in an editor, modified, and saved again.

    Q = require "q"
    Uploader = require "s3-uploader"

    module.exports = (policy) ->
      uploader = Uploader(policy)

      uploadFile = (data, retries=2) ->
        uploader.upload(data)
        .fail ->
          if retries > 0
            uploadFile(data, retries - 1)
          else
            throw "Failed to upload #{data.key}"

      publish: (data) ->
        {tree} = data

        # TODO: Gzip

        Q.all Object.keys(tree).map ({content, path}) ->
          # TODO: Content-Type
          uploadFile
            key: path
            blob: new Blob [content]
