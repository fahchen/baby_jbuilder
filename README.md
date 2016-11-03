# baby_jbuilder

```ruby
# hello_world.json.baby_jbuilder

json.name do
  json.first 'Phil'
  json.set! :last, 'Chen'
end
json.address do
  json.contry do
    json.name 'China'
    json.province do
      json.name 'Sichuan'
      json.city do
        json.name 'Chengdu'
      end
    end
  end
end
```

This will build the follwing data:
```json
// hello_world.json
{
  "name": {
    "first": "Phil",
    "last": "Chen"
  },

  "address": {
    "contry": {
      "name": "China",
      "province": {
        "name": "Sichuan",
        "city": {
          "name": "Chengdu"
        }
      }
    }
  }
}
```
