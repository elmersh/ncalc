{extends file="inc/theme.tpl"}
{$title = "home"}
{$active = "dashboard"}

{block name=content}
    <div class="content">
        <h1 class="text-center">Dashboard</h1>
        <h3 class="text-center">Bienvenido {$u.nombre}!</h3>
    </div>
{/block}