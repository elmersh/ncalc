{extends file="inc/theme.tpl"}
{$title = "home"}
{block name=content}
    <h1>Lista de materias</h1>
    {foreach $materias as $id => $materia}
        <div>{$materia.id} - <a href="/materia/{$materia.id}">{$materia.nombre}</a> - {$materia.codigo}</div>
    {/foreach}
{/block}