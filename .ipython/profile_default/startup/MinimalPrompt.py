# -*- coding: utf-8 -*-

from IPython.terminal.prompts import Prompts, Token
import os

class MyPrompt(Prompts):
    def in_prompt_tokens(self, cli=None):
        return [
            (Token.PromptNum, str(self.shell.execution_count)),
            (Token.Prompt, u'│ ')
        ]

    def continuation_prompt_tokens(self, cli=None, width=None):
        if width is None:
            width = self._width()
        return [
            (Token.Prompt, (' ' * (width - 2)) + u'│ ')
        ]

    def out_prompt_tokens(self, cli=None):
        return [(Token.Prompt, '\n')]

ip = get_ipython()
ip.prompts = MyPrompt(ip)
