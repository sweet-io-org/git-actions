# git-actions
segment required:

      - name: Increment version
        id: increment_version
        uses: sweet-io-org/git-actions/increment-version@master
        with:
          version: ${{ env.TAG_VERSION }}
          increment: "patch"