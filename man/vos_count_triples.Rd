% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/virtuoso.R
\name{vos_count_triples}
\alias{vos_count_triples}
\title{count triples}
\usage{
vos_count_triples(con, graph = NULL)
}
\arguments{
\item{con}{a ODBC connection to Virtuoso, from [`vos_connect()`]}

\item{graph}{Name (technically URI) for a graph in the database.
Can leave as default. If a graph is already specified by the
import file (e.g. in nquads), that will be used instead.}
}
\description{
count triples
}
