<!doctype html>
<html lang="en">
{include file="./head.tpl" title="gCalc - `$title|default:home`"}
<body class="min-h-screen">
<main class="w-full min-h-screen flex">
    <aside class="flex min-w-max print:hidden print:text-red">
        {include file="./header.tpl"}
    </aside>
    <main class="w-full min-h-screen bg-white flex flex-col">

            {include file="inc/page-title.tpl" url=$url|default:'' urlid=$urlid|default:'' btitle=$btitle|default: '' buttons=$buttons|default:false}
        <section class="w-full flex-1 py-8">
            <div class="container">
                {block name=content}{/block}
            </div>
        </section>

        <footer class="w-full bg-green-100">
            {include file="./footer.tpl"}
        </footer>
    </main>

</main>
<script src="{'js/app.js'|mix}"></script>
</body>
</html>

