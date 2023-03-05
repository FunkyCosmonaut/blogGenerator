module Main where

main :: IO ()
main = do
    putStrLn (makeHtml "dicks" "everything")


myhtml :: String
myhtml = html_ (body_ "Hello, world!")

wrapHtml :: String -> String
wrapHtml content = "<html><body>" <>content<> "</body></html>"

html_ :: String -> Structure
html_ = Structure . el "html"
--These functions are partially applied, el waits for the second argument
body_ :: String -> Structure
body_ = Structure . el "body"

head_ :: String -> Structure
head_ = Structure . el "head"

title_ :: String -> Structure
title_ = Structure . el "title"

dicks = (\content -> (<"<title>" <>content<> "</title>"))

makeHtml :: String -> String -> Structure
makeHtml title body = html_ (append_ (head_ (title_ title))  (body_ (append_ (h1_ "Title") (p_ body))))

p_ :: String ->  Structure
p_ = Structure . el "p"

h1_ :: String -> Structure
h1_ = Structure . el "h1"

el :: String -> String -> String
el tag content =
    "<" <> tag <> ">" <> content <> "</" <> tag <> ">"

getStructureString :: Structure -> String
getStructureString struct =
    case struct of
        Structure str -> str

        

getStructureString2 :: Structure -> String
getStructureString2 (Structure str) = str

newtype Html = Html String
newtype Structure = Structure String

render :: Html -> String
render html =
    case html of
        Html str -> str 

append_ :: Structure -> Structure -> Structure
append_ (Structure a) (Structure b) = Structure (a <> b)