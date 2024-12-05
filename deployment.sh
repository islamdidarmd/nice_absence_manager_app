#!/bin/bash
    BUILD_DIRECTORY="build/web/*"
    DEPLOY_DIRECTORY="docs/"
    COMMIT_MESSAGE="Deploy On Pages"
    BASE_HREF="/nice_absence_manager_app/"

    build_flutter_web() {
      flutter build web --base-href=$BASE_HREF
    }

    deploy_to_pages() {
      cp -r $BUILD_DIRECTORY $DEPLOY_DIRECTORY
      git add .
      git commit -m "$COMMIT_MESSAGE"
      git push
    }

    # Main script execution
    build_flutter_web
    deploy_to_pages
