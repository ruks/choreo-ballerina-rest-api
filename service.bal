import ballerina/http;
import ballerina/io;

type Album readonly & record {|
    string title;
    string artist;
|};

table<Album> key(title) albums = table [
    {title: "Blue Train", artist: "John Coltrane"},
    {title: "Jeru", artist: "Gerry Mulligan"}
];

service / on new http:Listener(9090) {

    resource function get albums() returns json|error {
        json resourcesJSON = check io:fileReadJson("resources.json");
        return resourcesJSON;
    }

    resource function post albums(@http:Payload Album album) returns Album {
        albums.add(album);
        return album;
    }
}