module Main where

main :: IO ()
main = putStrLn (makeHtml "dicks" "everything")

myhtml :: String
myhtml = html_ (body_ "Hello, world!")

wrapHtml :: String -> String
wrapHtml content = "<html><body>" <>content<> "</body></html>"

html_ :: String -> String
html_ = el "html"
--These functions are partially applied, el waits for the second argument
body_ :: String -> String
body_ = el "body"

head_ :: String -> String
head_ content ="<head>"<> content<> "</head>"

title_ :: String -> String
title_ content ="<title>" <>content<> "</title>"

dicks = (\content -> (<"<title>" <>content<> "</title>"))

makeHtml :: String -> String -> String
makeHtml title body = html_ ((head_ (title_ title)) <> (body_ ((h1_ "Title") <> (p_ body))))

p_ :: String -> String
p_ = el "p"

h1_ :: String -> String
h1_ = el "h1"

el :: String -> String -> String
el tag content =
    "<" <> tag <> ">" <> content <> "</" <> tag <> ">"