<!doctype html>
<html lang="en">
{include file="./head.tpl" title="gCalc - $title"}
<body>
{include file="./header.tpl"}
<main class="container mx-auto">
    <section class="w-full">
        <div class="container mx-auto py-8">
            {block name=content}{/block}
        </div>
    </section>
</main>
{include file="./footer.tpl"}
<script src="{'js/app.js'|mix}"></script>
</body>
</html>

