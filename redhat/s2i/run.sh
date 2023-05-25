oc new-project s2i
sleep 5
oc new-app --name java-serverhost  -i redhat-openjdk18-openshift:1.8  https://github.com/vikascjadhav/DO288-apps#manage-builds --context-dir java-serverhost
oc expose svc java-serverhost

#http://java-serverhost-s2i.apps.ocp4.example.com/
