1. Video 01
    > Tired of chasing bugs when state changes?
<pre>
- why does this widget rebuild when i don't want it?
- How do I test my business login?
- How do I clean up resource when widgets unmount?
</pre>

# a. Why to use ProviderScope in runApp();

![main.png](assets/images/main.png)

# b. Widget_tree

![widget_tree_01.png](assets/images/widget_tree_01.png)

- Feature A: <mark> Controller is only register and available here... </mark>
- Feature B: Controller is not registered using Get.put :::: Result: Controller not found

![widget_tree.png](assets/images/widget_tree.png)

# c. Riverpod Course Playlist

![playlist.png](assets/images/playlist.png)

# ========= Riverpod =========
<pre>
- Don't have to worry about, if stream is create or not
- Most of the time streams are causing leagues
- If Streams not handled perfectly, it causes Data leaks
</pre>
# ============================
<pre>
+ Don't have to worry about creation
+ Don't have to worry about disposal
+ Everything will be managed Automatically
</pre>
# ========= One-way Stream =========
![one_way_stream](assets/images/one_way_stream.png)
<pre>
- Riverpod handles things efficiently
- We can also do Testing Easily
- Riverpod Cache the last emitted value from the stream and display the value in user interface
</pre>