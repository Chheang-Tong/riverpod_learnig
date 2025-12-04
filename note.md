# 1. Bold Highlight
**This is bold text (highlight)**
# 2. Italic Highlight
*This is italic text*

 ![note01.png](assets/note/note01.png)

# 3. Bold + Italic (strong highlight)
***Very strong highlight***
# 4. Inline Code Highlight (most common for technical notes)

![note02.png](assets/note/note02.png)

# 5. Blockquote Highlight
> Important: Your controller must be registered before use.
# 6. Code Block Highlight
<pre> ```dart runApp(const ProviderScope(child: MyApp())); ``` </pre>

![note03.png](assets/note/note03.png)

# 7. Colored Highlight (GitHub supported trick)

<mark>This text is highlighted in yellow</mark>
# ============ Example ==============
# a. Why use <mark>ProviderScope</mark> in `runApp()`?

**ProviderScope** is required because Riverpod needs a container
to manage providers automatically.
# ==================================

![note04.png](assets/note/note04.png)


### 🔥 Why use Riverpod?
- <mark>No manual dispose()</mark>
- <mark>No memory leaks from Streams</mark>
- Cached values for performance
- Easy unit testing
