---
layout: note
title: swirl
header: Sharing swirl Courses
---

### GitHub
***Publishing:***

1. [Create a new repo on GutHub.](https://help.github.com/articles/create-a-repo)
	- The name of your course should be the same as the name of your repo.
	- Ex: The name of my course is "linear_regression" so the name of my repo must be `linear_regression`
2. In your course directory run the following:
	
	```
	git init
	git add -A
	git commit -m "first commit"
	git remote add origin https://github.com/[GitHubUserName]/[repoName].git
	git push -u origin master

	```

***Installing:***

```r
library("swirl")
install_course_github("username", "course_name")
```

---

### Dropbox
***Publishing:***

1. Zip your course up
2. Upload zipped course to Dropbox
3. Share link to zipped course
	- The link will look something like: `https://www.dropbox.com/s/xttkmuvu7hh72vu/my_course.zip`

***Installing:***

```r
library("swirl")
install_course_dropbox("[link to zip]")
```

---

### Google Drive
***Publishing:***

1. Zip your course up
2. Upload zipped course to Google Drive
3. Click "Share.." on the zip you want to share
4. Make sure "Who has access" is set to "Public on the web" or "Anyone with the link"
5. Copy and share the link
	- The link will look something like: `https://drive.google.com/file/d/FILE_ID/edit?usp=sharing`

***Installing:***

```r
library("swirl")
install_course_google_drive("[link to zip]")
```