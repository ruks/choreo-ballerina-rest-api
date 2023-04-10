import ballerina/http;
import ballerina/io;
import ballerina/config;

type Album readonly & record {|
    string title;
    string artist;
|};

table<Album> key(title) albums = table [
    {title: "Blue Train", artist: "John Coltrane"},
    {title: "Jeru", artist: "Gerry Mulligan"}
];

configurable string serviceName = ?;

service / on new http:Listener(9090) {

    resource function get albums() returns json|error {
        return serviceName;
    }

    resource function post albums(@http:Payload Album album) returns Album {
        albums.add(album);
        return album;
    }
}
