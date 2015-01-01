S3 Publisher
============

Publish a filetree to S3.

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

        # TODO: Path Prefix

        Q.all Object.keys(tree).map ({content, path}) ->
          # TODO: Content-Type
          uploadFile
            key: path
            blob: new Blob [content]
