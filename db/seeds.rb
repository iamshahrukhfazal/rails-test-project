# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# Populating users
User.create(email: 'khuzaima.tehseen@devsinc.com', password: 'khuzaima123456', role: 2)
user2 = User.create(email: 'umber.zahid@devsinc.com', password: 'umber123456', role: 0)
User.create(email: 'abdul.raheel@devsinc.com', password: 'raheel123456', role: 0)
user4 = User.create(email: 'shahrukh.fazal@devsinc.com', password: 'shahrukh123456', role: 0)
User.create(email: 'sk902224@gmail.com', password: 'shahrukh123456', role: 1)

# Populating Post
Post.create(title: 'How User Pluck in Rails', content: '
    <div>
        <h1>Plucks</h1>
        <p title=About W3Schools>
        You cannot omit quotes around an attribute value
        if the value contains spaces.
        </p>
        <p><b>
        If you move the mouse over the paragraph above,
        your browser will only display the first word from the title.
        </b></p>
    <div>', user_id: user4.id, status: 1)
Post.create(title: 'How User Pluck in Rails', content: '
    <div>
        <h1>Plucks</h1>
        <p title=About W3Schools>
        You cannot omit quotes around an attribute value
        if the value contains spaces.
        </p>
        <p><b>
        If you move the mouse over the paragraph above,
        your browser will only display the first word from the title.
        </b></p>
    <div>', user_id: user4.id, status: 0)
Post.create(title: 'How User Pluck in Rails', content: '
    <div>
        <h1>Plucks</h1>
        <p title=About W3Schools>
        You cannot omit quotes around an attribute value
        if the value contains spaces.
        </p>
        <p><b>
        If you move the mouse over the paragraph above,
        your browser will only display the first word from the title.
        </b></p>
    <div>', user_id: user4.id, status: 1)
Post.create(title: 'How User Pluck in Rails', content: '
    <div>
        <h1>Plucks</h1>
        <p title=About W3Schools>
        You cannot omit quotes around an attribute value
        if the value contains spaces.
        </p>
        <p><b>
        If you move the mouse over the paragraph above,
        your browser will only display the first word from the title.
        </b></p>
    <div>', user_id: user2.id, status: 1)
Post.create(title: 'How Nested Routing', content: '
    <div>
        <h1>Plucks</h1>
        <p title=About W3Schools>
        You cannot omit quotes around an attribute value
        if the value contains spaces.
        </p>
        <p><b>
        If you move the mouse over the paragraph above,
        your browser will only display the first word from the title.
        </b></p>
    <div>', user_id: user2.id, status: 'published')
Post.create(title: 'How User Bang Operator in Rails', content: '
    <div>
        <h1>Plucks</h1>
        <p title=About W3Schools>
        You cannot omit quotes around an attribute value
        if the value contains spaces.
        </p>
        <p><b>
        If you move the mouse over the paragraph above,
        your browser will only display the first word from the title.
        </b></p>
    <div>', user_id: user2.id, status: 0)
