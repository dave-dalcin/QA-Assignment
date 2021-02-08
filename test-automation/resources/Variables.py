import random
import string

def get_random_string(length):
    letters = string.ascii_lowercase
    result_str = ''.join(random.choice(letters) for i in range(length))
    return result_str

#Test DAta
#TC1
signUpNewUser= "User" + get_random_string(5)
signUpNewEmail= "user" + get_random_string(5)+"@gmail.com"
signUpnewPasswd = "passwd" + get_random_string(5)
#TC2, TC3
signUpInvalidUser= "InvalidUser" + get_random_string(5)
signUpInvalidEmail= "invaliduser" + get_random_string(5)+"@gmail.com"
signUpInvalidPasswd = "passwd" + get_random_string(5)

#TC5, TC6, TC14
existentUser= "posts1"
existentEmail= "posts1@gmail.com"
existentPassword= "passwd"

#TC14
newArticleTitle= "Title" + get_random_string(3)
newArticleAbout= "About" + get_random_string(3)
newArticleMarkdown= "Markdown" + get_random_string(3)
newArticleTags= "tag" + get_random_string(3)

#TC17
editArticleTitle= "Title" + get_random_string(3)
editArticleAbout= "About" + get_random_string(3)
editArticleMarkdown= "Markdown" + get_random_string(3)
editArticleTags= "tag" + get_random_string(3)



