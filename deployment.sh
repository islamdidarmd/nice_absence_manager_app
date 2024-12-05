git checkout gh-pages
flutter build web --base-href=/nice_absence_manager_app/
cp -r build/web/* docs/
git add .
git commit -m "Deploy On Pages"
git push
