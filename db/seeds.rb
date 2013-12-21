User.create(
  email: 'hello@jamesnewton.com',
  password: 'password',
  password_confirmation: 'password'
)

FactoryGirl.create(:post)

FactoryGirl.create(:post,
  content: <<-MARKDOWN
# #{Faker::Lorem.words(5).join(' ')}
## #{Faker::Lorem.words(5).join(' ')}
### #{Faker::Lorem.words(5).join(' ')}
#### #{Faker::Lorem.words(5).join(' ')}
##### #{Faker::Lorem.words(5).join(' ')}
###### #{Faker::Lorem.words(5).join(' ')}

`Ut tenetur tempora perferendis.` Maiores vitae et voluptatem natus. "Pariatur eos ab dignissimos qui exercitationem." Voluptate quidem reiciendis corporis nesciunt et occaecati's repellat qui's. Repudiandae ea temporibus ut odio quam nihil veritatis. Enim et vero ipsum sed. Esse id blanditiis neque ipsa molestiae laborum omnis sed. Debitis magnam voluptates qui quia. Ut earum incidunt exercitationem possimus harum. Vel velit enim odit assumenda recusandae possimus. *Ipsa saepe voluptas impedit repellendus in vel quo et.*

> **Ut tenetur tempora perferendis.** Maiores vitae et voluptatem natus. Pariatur eos ab dignissimos qui exercitationem. Voluptate quidem reiciendis corporis nesciunt et occaecati repellat qui. Repudiandae ea temporibus ut odio quam nihil veritatis. Enim et vero ipsum sed. Esse id blanditiis neque ipsa molestiae laborum omnis sed. Debitis magnam voluptates qui quia. Ut earum incidunt exercitationem possimus harum. Vel velit enim odit assumenda recusandae possimus. Ipsa saepe voluptas impedit repellendus in vel quo et.

[Ut tenetur tempora perferendis](#). Maiores vitae et voluptatem natus. Pariatur eos ab dignissimos qui exercitationem. Voluptate quidem reiciendis corporis nesciunt et occaecati repellat qui. Repudiandae ea temporibus ut odio quam nihil veritatis. Enim et vero ipsum sed. Esse id blanditiis neque ipsa molestiae laborum omnis sed. Debitis magnam voluptates qui quia. Ut earum incidunt exercitationem possimus harum. Vel velit enim odit assumenda recusandae possimus. Ipsa saepe voluptas impedit repellendus in vel quo et.
  MARKDOWN
)

FactoryGirl.create(:post,
  content: <<-RUBY
#{Faker::Lorem.paragraph}

```ruby
class Person
  def intitalize(first_name, last_name)
    @first_name = first_name
    @last_name  = last_name
  end

  def name
    "\#{@first_name} \#{@last_name}"
  end
end
```

#{Faker::Lorem.paragraph}
  RUBY
)
