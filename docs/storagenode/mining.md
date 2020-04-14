# storagenode mining

## Description

Display mining related info

## Usage
```
storagenode mining [command]
```

## Available Commands

| Name| Description |                           
| --------------- | --------------------- |
| info  | Show statement info by [statement id]|
|  status | Show all local statement status|

## Examples
```
./storagenode mining status
Current block time: 2020-08-09 12:44:35.890907005 +0000 UTC
Active statements: 2
statement(411d6463-fe1d-4374-ab42-726aa2937946), next_expiry(2020-04-09 12:46:58 UTC), final_expiry(2023-06-19 18:00:13 UTC)
statement(58c7700c-7f17-42ec-8317-f66bbe6fcd05), next_expiry(2020-04-09 12:46:58 UTC), final_expiry(2023-06-19 18:00:13 UTC)

Inactive statement: 0


./storagenode mining info 411d6463-fe1d-4374-ab42-726aa2937946  
expired time: 2023-06-19 18:00:13 +0800 CST
end time: 2020-08-09 13:35:43.56402227 +0000 UTC
piece path[0]: 82EB03450C809F3F8867C8D30BDD42D6C8802E92/new2/file100_df8087fde4e6492d828f8fc715867fe2.blob/0
piece path[1]: 82EB03450C809F3F8867C8D30BDD42D6C8802E92/new2/file100_df8087fde4e6492d828f8fc715867fe2.blob/1
piece path[2]: 82EB03450C809F3F8867C8D30BDD42D6C8802E92/new2/file100_df8087fde4e6492d828f8fc715867fe2.blob/2
piece path[3]: 82EB03450C809F3F8867C8D30BDD42D6C8802E92/new2/file100_df8087fde4e6492d828f8fc715867fe2.blob/3
piece path[4]: 82EB03450C809F3F8867C8D30BDD42D6C8802E92/new2/file100_df8087fde4e6492d828f8fc715867fe2.blob/4
piece path[5]: 82EB03450C809F3F8867C8D30BDD42D6C8802E92/new2/file100_df8087fde4e6492d828f8fc715867fe2.blob/5
piece path[6]: 82EB03450C809F3F8867C8D30BDD42D6C8802E92/new2/file100_df8087fde4e6492d828f8fc715867fe2.blob/6
piece path[7]: 82EB03450C809F3F8867C8D30BDD42D6C8802E92/new2/file100_df8087fde4e6492d828f8fc715867fe2.blob/7
piece path[8]: 82EB03450C809F3F8867C8D30BDD42D6C8802E92/new2/file100_df8087fde4e6492d828f8fc715867fe2.blob/8

```
