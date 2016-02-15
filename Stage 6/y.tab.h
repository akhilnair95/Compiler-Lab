/* A Bison parser, made by GNU Bison 3.0.2.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2013 Free Software Foundation, Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

#ifndef YY_YY_Y_TAB_H_INCLUDED
# define YY_YY_Y_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    READ = 258,
    WRITE = 259,
    ASG = 260,
    END = 261,
    STAT = 262,
    ID = 263,
    PLUS = 264,
    MUL = 265,
    NUM = 266,
    MINUS = 267,
    IF = 268,
    THEN = 269,
    ENDIF = 270,
    WHILE = 271,
    DO = 272,
    ENDWHILE = 273,
    EQ = 274,
    GT = 275,
    LT = 276,
    DECL = 277,
    ENDDECL = 278,
    INT = 279
  };
#endif
/* Tokens.  */
#define READ 258
#define WRITE 259
#define ASG 260
#define END 261
#define STAT 262
#define ID 263
#define PLUS 264
#define MUL 265
#define NUM 266
#define MINUS 267
#define IF 268
#define THEN 269
#define ENDIF 270
#define WHILE 271
#define DO 272
#define ENDWHILE 273
#define EQ 274
#define GT 275
#define LT 276
#define DECL 277
#define ENDDECL 278
#define INT 279

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
