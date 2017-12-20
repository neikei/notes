### 2017-08-07: HipChat notifications

Bash snippets for HipChat notifications.

```bash
#: HipChat API v2
curl -X POST \
     -H "Content-Type: application/json" \
     --data "{ \"color\":\"green\", \"message\":\"HipCHat API v2\", \"message_format\":\"text\" }" \
     https://api.hipchat.com/v2/room/<room_api_id>/notification?auth_token=<auth_token>

#: HipChat API v1
curl --data "from=Sender&room_id=<room_api_id>&message=%28successful%29+HipChat+API+v1+&message_format=text&color=green" "https://api.hipchat.com/v1/rooms/message?format=json&auth_token=<auth_token>"
```

Further links:

- [Official HipChat Documentation](https://www.hipchat.com/docs/apiv2/method/send_room_notification)
