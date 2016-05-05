## Debugging and testing Rails application

The `blog_eloquently` directory contains the web application we have been
developing in class. Several more tests have been added, and 9 bugs have been
introduced.

Your task is to find the bugs by playing around with the application in your
browser. When you find a bug, you should write a test that describes how the
application should behave once the bug is fixed. The test should fail once you
write it. After you write the test, write the code that will fix the bug.

If you get stuck and cannot find any more bugs, ask Eric.

Note: Seeing a rails error message is not necessarily an error. For example if
you try to submit a comment without entering anything in the form, we just want
to make sure an empty comment isn't added to the database. It's ok if the
application redirects somewhere without showing an error message or shows the
default Rails error page that looks like this:

```
ActiveRecord::RecordInvalid in CommentsController#create
Validation failed: Author name can't be blank, Content can't be blank
```

