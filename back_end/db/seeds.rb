# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Comic.destroy_all
ComicPage.destroy_all
Like.destroy_all
UserComic.destroy_all
Comment.destroy_all

usernames = ["artrules", "lovelylace", "rosemary", "stringsoftwine"]
comic_names = ["lovelybones", "loveless", "simple_method", "lovingly_plain"]
comic_page_names = ["the beginning", "lovely end", "at least we tried-chapter 2", "fingers locked", "busted ends"]
descriptions = ["this was a great beginning, can't wait for the end", "didn't they almost have it all?", "art is on point, don't stop!", "sometimes a little love is all you need"]
likes = [1,2,3,4]


user_1 = User.create(user_name: usernames.sample(), user_description: descriptions.sample())
user_2 = User.create(user_name: usernames.sample(), user_description: descriptions.sample())
user_3 = User.create(user_name: usernames.sample(), user_description: descriptions.sample())


comic_1 = Comic.create(title: comic_names.sample(), comic_desc: descriptions.sample())
comic_2 = Comic.create(title: comic_names.sample(), comic_desc: descriptions.sample())
comic_3 = Comic.create(title: comic_names.sample(), comic_desc: descriptions.sample())
comic_4 = Comic.create(title: comic_names.sample(), comic_desc: descriptions.sample())


comic_page1 = ComicPage.create(page_name: comic_page_names.sample(), page_desc: descriptions.sample(), comic_id: comic_1.id )
comic_page2 = ComicPage.create(page_name: comic_page_names.sample(), page_desc: descriptions.sample(), comic_id: comic_3.id )
comic_page3 = ComicPage.create(page_name: comic_page_names.sample(), page_desc: descriptions.sample(), comic_id: comic_2.id )

Like.create(likeable: user_2, num_likes: 2)
Like.create(likeable: comic_2, num_likes: 4)
Like.create(likeable: user_3,  num_likes: 4)
Like.create(likeable: comic_1, num_likes: 1)
Like.create(likeable: comic_1, num_likes: 2)

UserComic.create(user_id: user_2.id, comic_id: comic_2.id)
UserComic.create(user_id: user_3.id, comic_id: comic_3.id)
UserComic.create(user_id: user_1.id, comic_id: comic_1.id)

Comment.create(commentable: comic_page3, content: descriptions.sample())
Comment.create(commentable: comic_page2, content: descriptions.sample())

Comment.create(commentable: comic_page1, content: descriptions.sample())
Comment.create(commentable: comic_page1, content: descriptions.sample())

