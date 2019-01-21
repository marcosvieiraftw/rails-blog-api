# ---------- Users --------------------|
user_role = UserRole.new
user_role.name = "Admin"
user_role.code = UserRole::ADMIN
user_role.save!

user_role = UserRole.new
user_role.name = "Regular"
user_role.code = UserRole::REGULAR
user_role.save!
# --------------------------------------|

# ---------- Users --------------------|
user = User.new
user.user_role = UserRole.find_by_code(UserRole::ADMIN);
user.name = 'admin'
user.email = 'admin@admin.com.br'
user.password = '123456'
user.password_confirmation = '123456'
user.save!

user = User.new
user.user_role = UserRole.find_by_code(UserRole::REGULAR);
user.name = 'regular'
user.email = 'regular@regular.com.br'
user.password = '123456'
user.password_confirmation = '123456'
user.save!

user = User.new
user.user_role = UserRole.find_by_code(UserRole::REGULAR);
user.name = 'regular2'
user.email = 'regular2@regular.com.br'
user.password = '123456'
user.password_confirmation = '123456'
user.save!

user = User.new
user.user_role = UserRole.find_by_code(UserRole::REGULAR);
user.name = 'regular3'
user.email = 'regular3@regular.com.br'
user.password = '123456'
user.password_confirmation = '123456'
user.save!
# --------------------------------------|


# ---------- Posts ---------------------|
post = Post.new
post.user = User.first
post.title = 'Primeiro post'
post.description = 'Lorem ipsum dolor..'
post.save!
# --------------------------------------|


# ---------- Comments ------------------|
comment = Comment.new
comment.user = User.first
comment.post = Post.first
comment.description = 'Esse post é legal'
comment.save!
# --------------------------------------|